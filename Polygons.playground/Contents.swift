import UIKit

// Aaron Ireland
// Polygons.Playground
// January 14, 2019

// Polygon protocol, defines variables and functions that must be used by any polygon
protocol Polygon {
    var name: String { get }
    var sides: Int { get }
    func perimeter() -> Float
    func area() -> Float
}

// extension of polygon protocol, used to define the draw method
extension Polygon {
    
    func draw(){
        
        // prints out all the information about the polygon
        print("\(name) has \(sides) sides. Perimeter is \(perimeter()). Area is \(area()).")
    }
}

//~~~~~~~~~~~~~~~~~~~~~~

// struct for a triangle type polygon, 3 sides with unique perimeter and area functions
struct Triangle: Polygon {
    
    var side1: Float
    var side2: Float
    var side3: Float
    
    var name: String
    
    var sides: Int
    
    // function for triangle's perimeter
    func perimeter() -> Float {
        return Float(side1 + side2 + side3)
    }
    
    // additional height function, exclusive only to triangles
    func height() -> Float {
        return Float((perimeter()) / 5)
    }
    
    //function for triangle's area, side3 will be the triangle's base
    func area() -> Float {
        return Float(0.5 * (side3 * height()))
    }
}

//~~~~~~~~~~~~~~~~~~~~~~

// struct for square type polygon, 1 side length with unid=que perimeter and area functions
struct Square: Polygon {
    
    var sideLength: Float
    
    var name: String
    
    var sides: Int
    
    // function for square's perimeter
    func perimeter() -> Float {
        return Float(4 * sideLength)
    }
    
    // function for square's area
    func area() -> Float {
        return Float(sideLength * sideLength)
    }
}

//~~~~~~~~~~~~~~~~~~~~~~

// struct for rectangle type polygon, 2 unique sides with unique perimeter and area functions
struct Rectangle: Polygon {
    
    var side1: Float
    var side2: Float
    
    var name: String
    
    var sides: Int
    
    // function for rectangle's perimeter
    func perimeter() -> Float {
        return Float(2 * (side1 + side2))
    }
    
    // function for rectangle's area
    func area() -> Float {
        return Float(side1 * side2)
    }
}

//~~~~~~~~~~~~~~~~~~~~~~

// creation of new array of polygons
private var polygons = [Polygon]()


// below, 6 new shapes will be initialized and appended to the polygon array
private let triangle1 = Triangle.init(side1: 3, side2: 4, side3: 5, name: "Triangle", sides: 3)
polygons.append(triangle1)

private let triangle2 = Triangle.init(side1: 6, side2: 8, side3: 10, name: "Triangle", sides: 3)
polygons.append(triangle2)

private let square1 = Square.init(sideLength: 15, name: "Square", sides: 4)
polygons.append(square1)

private let square2 = Square.init(sideLength: 25, name: "Square", sides: 4)
polygons.append(square2)

private let rectangle1 = Rectangle.init(side1: 20, side2: 13, name: "Rectangle", sides: 4)
polygons.append(rectangle1)

private let rectangle2 = Rectangle.init(side1: 17, side2: 50, name: "Rectangle", sides: 4)
polygons.append(rectangle2)


// for loop that iterates through each polygon, calling the draw() function each time
for polygon in polygons {
    
    polygon.draw()
}
