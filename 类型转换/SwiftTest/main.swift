//
//  main.swift
//  SwiftTest
//
//  Created by whs on 16/1/4.
//  Copyright © 2016年 whs. All rights reserved.
//

import Foundation

class MedisItem {
    var name:String
    init(name:String){
    self.name = name
    }
}

class Movie: MedisItem {
    var director:String
    init(name:String , director:String){
        self.director = director
        super.init(name: name)
    }
}

class Song: MedisItem {
    var artist:String
    init(name: String , artist:String) {
        self.artist = artist
        super.init(name: name)
    }
}

//Swiftd的类型检测器能够演绎出Move和Song有共同的父类MedisItem,所以推导出MedisItem[]类作为library的类型
var library = [Movie(name: "Casablanca", director: "Michael Curtiz"),
             Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
             Movie(name: "Citizen Kane", director: "Orson Welles"),
             Song(name: "The One And Only", artist: "Chesney Hawkes"),
             Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
//在幕后library 里存储的项依然是 Movie 和 Song 类型的，但是，若你迭代它，取出的实例会是 MediaItem 类型的，而不是 Movie 和 Song 类型的。为了让它们作为它们本来的类型工作，你需要检查它们的类型或者向下转换它们的类型到其它类型，就像下面描述的一样


//检查类型
//用类型检查操作符(is)来检查一个实例是否属于特定子类型。类型检查操作符返回 true 若实例属于那个子类型，若不属于返回 false

var movieCount = 0
var songCount = 0


for item in library{
    if item is Movie{
        ++movieCount
    }else if item is Song{
        ++songCount
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")


//向下转型（简称下转）
//某类型的一个常量或变量可能在幕后实际上属于一个子类。你可以相信，上面就是这种情况。你可以尝试向下转到它的子类型，用类型转换操作符(as)
//因为向下转型可能会失败，类型转换操作符带有两种不同形式。可选形式（ optional form） as? 返回一个你试图下转成的类型的可选值（optional value）。强制形式 as 把试图向下转型和强制解包（force-unwraps）结果作为一个混合动作
//当你不确定下转可以成功时，用类型转换的可选形式(as?)。可选形式的类型转换总是返回一个可选值（optional value），并且若下转是不可能的，可选值将是 nil 。这使你能够检查下转是否成功。

//只有你可以确定下转一定会成功时，才使用强制形式。当你试图下转为一个不正确的类型时，强制形式的类型转换会触发一个runtime error。

for item1 in library{
    
    //尝试将 item 转为 Movie类型。若成功，设置一个新的临时常量 movie 来存储返回的optional Movie
    if let movie = item1 as? Movie{
        print("Movie:\(movie.name),dir.\(movie.director)")
    }else if let song = item1 as? Song{
        print("Song:\(song.name),dir.\(song.artist)")
    }
}

//Any和AnyObject的转换
/*
Swift为不确定类型提供了两种特殊类型别名：
1. AnyObject可以代表任何class类型的实例。
2. Any可以表示任何类型，除了方法类型（function types）。
*/

//AnyObject类型
/*
当需要在工作中使用Cocoa APIs，它一般接收一个AnyObject[]类型的数组，或者说“一个任何对象类型的数组”。这是因为OC没有明确的类型化数组。但是，你常常可以确定包含在仅从你知道的API信息提供的这样一个数组中的对象的类型。
在这些情况下，你可以使用强制形式的类型转换(as)来下转在数组中的每一项到比 AnyObject 更明确的类型，不需要可选解包（optional unwrapping）。
*/

//下面的示例定义了一个 AnyObject[] 类型的数组并填入三个Movie类型的实例：
let someObjects:[AnyObject] = [Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")]

//因为知道这个数组只包含 Movie 实例，你可以直接用(as)下转并解包到不可选的Movie类型
for objc in someObjects{
     let movie = objc as! Movie
     print("Movie: '\(movie.name)', dir. \(movie.director)")
}

//为了变为一个更短的形式，下转someObjects类型成功 Movie[] 类型代替下转每一项：
for movie in someObjects as! [Movie]{
      print("Movie: '\(movie.name)', dir. \(movie.director)")
}

//Any类型
//这里有个示例，使用 Any 类型来和混合的不同类型一起工作，包括非class类型。它创建了一个可以存储Any类型的数组things：
var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.1415)
things.append("hello")
things.append((3.0,5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
//可以在 switch cases里用is 和 as 操作符来发觉只知道是 Any 或 AnyObject的常量或变量的类型
for thing in things{
    switch thing{
    case 0 as Int:
         print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called '\(movie.name)', dir. \(movie.director)")
    default:
        print("something else")
    }
}
//注意：在一个switch语句的case中使用强制形式的类型转换操作符(as, 而不是 as?) 来检查和转换到一个规定的类型。在switch case 语句的内容中这种检查总是安全的。
























