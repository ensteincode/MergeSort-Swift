//
//  main.swift
//  MergeSort
//
//  Created by Ensteincode on 06/03/18.

import Foundation

print("Demonstration of Merged Sort")

func mergeSort<T: Comparable>(array: [T]) -> [T] {
    if array.count <= 2 {
        return array
    }
    
    let mid: Int = array.count / 2
    let leftPart = Array(array[0..<mid])
    let rightPart = Array(array[mid...])
    let dividedLeft = mergeSort(array: leftPart)
    let dividedRight = mergeSort(array: rightPart)
    
    return merge(left: dividedLeft, right: dividedRight)
}

func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
    var left = left
    var right = right
    var merged = [T]()
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            merged.append(left.removeFirst())
        } else {
            merged.append(right.removeFirst())
        }
    }
    return merged + left + right
}

var randomArray:[Int] = []
for _ in 0...50 {
    randomArray.append(Int(arc4random_uniform(1000)))
}

print("Unsorted ============ \n  \(randomArray)  \n =============")
print("Sorted ============ \n  \(mergeSort(array: randomArray))  \n =============")

