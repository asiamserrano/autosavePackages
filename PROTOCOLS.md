#  PROTOCOL TYPES

## 1. Role/Capability protocols (“is/behaves as”)

**• Purpose:** Define behavior or semantic capability that changes how the type can be used.

**• Examples:** Equatable, Hashable, Codable, Sendable, Error, View, Sequence.

**• Naming:** Adjectives or role nouns.

```
    protocol Teachable {
        func teach()
    }

    struct Teacher: Teachable {
        func teach() {
            print("Teaching class")
        }
    }
```

## 2. Providing/Access protocols (“has/provides”)

**• Purpose:** Expose data, configuration, or services without implying deep behavior.

**• Examples:** ImageProviding, ConfigurationProviding, CredentialsProviding, ClassNameProviding.

**• Naming:** “-Providing” or “Provider” (protocol vs concrete type).

```
    protocol ScheduleProviding {
        var schedule: [String] { get }
    }

    struct Student: ScheduleProviding {
        let schedule: [String]
    }
```

## 3. Marker/Tag protocols (no requirements)

**• Purpose:** Tag types for constraints or semantics; often used in generic bounds or conditional conformance.

**• Examples:** AnyObject, Sendable (in some contexts acts as marker), CustomReflectable (can be marker-ish if defaulted).

**• Naming:** Nouns/adjectives; keep them short and meaningful.

```
    protocol SchoolMember {}

    struct Teacher: SchoolMember {}
    struct Student: SchoolMember {}

    func printBadge<T: SchoolMember>(_ member: T) {
        print("Authorized school member")
    }
```

## 4. Data model/value protocols

**• Purpose:** Shape a data model or value interface—properties primarily define structure.

**• Examples:** Identifiable, RawRepresentable, CaseIterable, OptionSet (struct, but similar concept).

**• Naming:** Nouns/adjectives that describe the role in a model (Identifiable, RawRepresentable).

```
    protocol IdentifiablePerson {
        var id: Int { get }
    }

    struct Student: IdentifiablePerson {
        let id: Int
    }
```

## 5. Factory/Builder/Initializer protocols

**• Purpose:** Construct or configure instances.

**• Examples:** Patterns like Factory, Builder, DependencyContainer (often app-defined).

**• Naming:** Factory, Builder, Initializable, Constructible.

```
    protocol StudentFactory {
        func makeStudent(name: String) -> Student
    }

    struct DefaultStudentFactory: StudentFactory {
        func makeStudent(name: String) -> Student {
            Student(id: Int.random(in: 1...1000))
        }
    }
```

## 6. Service/Behavioral API protocols

**• Purpose:** Define an API surface for services or subsystems (often used for dependency injection).

**• Examples:** URLProtocol (class), URLSessionTaskDelegate (delegate role), Logger-like protocols in apps.

**• Naming:** Nouns that describe the service (Cache, Logger), or “-Service”/“-Client” suffixes.

```
    protocol AttendanceService {
        func markPresent(studentID: Int)
    }

    struct DefaultAttendanceService: AttendanceService {
        func markPresent(studentID: Int) {
            print("Marked \(studentID) present")
        }
    }
```

## 7. Adapters/Bridging protocols

**• Purpose:** Bridge between two representations or systems.

**• Examples:** CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable.

**• Naming:** “CustomXxxConvertible/Representable/Bridge” patterns are common.

```
    protocol ReportCardConvertible {
        func asReportCard() -> String
    }

    struct Student: ReportCardConvertible {
        let id: Int
        
        func asReportCard() -> String {
            "Report for student \(id)"
        }
    }
```

## 8. UI/Rendering protocols

**• Purpose:** Define renderable/visual roles.

**• Examples:** View, Shape, Animatable, Layout (SwiftUI).

**• Naming:** Short role nouns/adjectives.

```
    protocol Renderable {
        func render() -> String
    }

    struct StudentView: Renderable {
        func render() -> String {
            "Student View UI"
        }
    }
```

## 9. Algorithmic/Collection protocols

**• Purpose:** Define traversable/collection semantics and algorithm contracts.

**• Examples:** Sequence, IteratorProtocol, Collection, BidirectionalCollection, RandomAccessCollection.

**• Naming:** Nouns like Sequence/Coll

```
    protocol Roster {
        associatedtype Member
        func allMembers() -> [Member]
    }

    struct ClassRoster: Roster {
        func allMembers() -> [Student] {
            [Student(id: 1), Student(id: 2)]
        }
    }
```

## 10. Delegate / Callback protocols

**• Purpose:** Define an event-driven communication contract where one type notifies another about lifecycle events, state changes, or user actions without tight coupling. Commonly used to invert control flow and avoid direct dependencies.

**• Examples:** URLSessionDelegate, UITableViewDelegate, UIApplicationDelegate, CAAnimationDelegate.

**• Naming:** Typically use the “-Delegate” suffix for event receivers (e.g., GraduationDelegate, TableViewDelegate) or “-Handler” / “-Listener” in some architectures.

```
    protocol GraduationDelegate: AnyObject {
        func didGraduate(student: Student)
    }

    class Principal: GraduationDelegate {
        func didGraduate(student: Student) {
            print("Student \(student.id) graduated")
        }
    }
```
## Summary
| Type        | What It Means                            |
| ----------- | ---------------------------------------- |
| Capability  | “Can do this”                            |
| Providing   | “Has/provides this”                      |
| Marker      | “Is this kind of thing”                  |
| Data Model  | “Has this structure”                     |
| Factory     | “Can create this”                        |
| Service     | “Performs this subsystem role”           |
| Adapter     | “Can convert into this”                  |
| UI          | “Can render/display”                     |
| Algorithmic | “Supports traversal/collection behavior” |
| Delegate    | “Receives events”                        |
