/*
Copyright 2020 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

import Foundation
@testable import AEPServices

public class MockDataQueue: DataQueue {
    let queue = ThreadSafeArray<DataEntity>()
    
    public init(){
        
    }
    
    public func add(dataEntity: DataEntity) -> Bool {
        queue.append(dataEntity)
        return true
    }
    
    public func peek() -> DataEntity? {
        return queue.shallowCopy.first
    }
    
    public func remove() -> Bool {
        guard let first = peek() else { return true }
        let _ = queue.filterRemove({$0.uniqueIdentifier == first.uniqueIdentifier})
        return true
    }
    
    public func clear() -> Bool {
        queue.clear()
        return true
    }
    
    
}
