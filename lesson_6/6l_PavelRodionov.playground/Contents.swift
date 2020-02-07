import Foundation

struct Circle {
    var radius: Double
}

struct Reqtangle {
    var sideA: Double
    var sideB: Double
}

struct Queue<T> {
    private var queue: [T] = []
    
    init(_ queue: [T] = []) {
        self.queue = queue;
    }

    public mutating func put(_ t: T) {
        queue.append(t)
    }

    public mutating func get() -> T? {
        guard !queue.isEmpty else {return nil}
        return queue.removeFirst()
    }

    public func each(_ body: (T) -> Void) -> Queue<T> {
        for x in queue {
            body(x)
        }
        return self
    }
    
    public func all(_ body: ([T]) -> Void) -> Queue<T> {
        body(queue)
        return self
    }
    
    public func filter(_ body: (T) -> Bool) -> Queue<T> {
        var temp: [T] = []
        for x in queue {
            if !body(x) {
                temp.append(x)
            }
        }
        return Queue<T>(temp)
    }
    
    public func map<R>(_ body: (T) -> R) -> Queue<R> {
        var temp: [R] = []
        for x in queue {
            temp.append(body(x))
        }
        return Queue<R>(temp)
    }
    
    public subscript(index: Int) -> T? {
        guard !queue.isEmpty else {return nil}
        return queue[index]
    }
}


var queue1 = Queue<Circle>()
queue1.put(Circle(radius: 4.7))
queue1.put(Circle(radius: 2.1))
queue1.put(Circle(radius: 11.8))

print(queue1.get()!)
print(queue1.get()!)

var queue2 = Queue<Reqtangle>()
queue2.put(Reqtangle(sideA: 2.1, sideB: 31.6))
queue2.put(Reqtangle(sideA: 5.3, sideB: 7.2))
queue2.put(Reqtangle(sideA: 7.4, sideB: 22.5))
queue2.put(Reqtangle(sideA: 8.2, sideB: 4.5))
queue2.put(Reqtangle(sideA: 12.4, sideB: 13.5))

queue2
.all {print($0)}
.filter {rec in rec.sideA < 5}
.filter {rec in rec.sideB < 10}
.all {print($0)}
.map {rec in String("Reqtangle with sideA: \(rec.sideA), sideB: \(rec.sideB)")}
.each {print($0)}

queue2[2]


var queueNumbers = Queue<Int>()
queueNumbers.put(3)
queueNumbers.put(2)
queueNumbers.put(1)
queueNumbers.put(7)
queueNumbers.put(6)

var queueWords = Queue<String>()
queueWords.put("zero")
queueWords.put("one")
queueWords.put("two")
queueWords.put("three")
queueWords.put("four")
queueWords.put("five")
queueWords.put("six")
queueWords.put("seven")
queueWords.put("eight")
queueWords.put("nine")

queueNumbers
    .all {print($0)}
    .map {index in queueWords[index]!}
    .all {print($0)}













