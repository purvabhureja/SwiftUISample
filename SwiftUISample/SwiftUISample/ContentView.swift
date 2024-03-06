// Created by Purva Bhureja

import SwiftUI

struct ContentView: View {

  @State var selectedPerson: Person?  // selected object from list.
  @State private var selectedName: String?  // string that contains selected name from list.

  var body: some View {
    let personData = self.loadJson("data.json") as [Person]
    NavigationView {
      List(personData, id: \.name) { person in
        NavigationLink(
          destination: DetailView(person: person), tag: person.name!, selection: $selectedName
        ) {
          Text(person.name!)
        }
      }
      .listStyle(SidebarListStyle())
      .navigationTitle("Persons List")
    }
  }

  // This function will be used to load and read the JSON file from assets and will convert into expected object.
  func loadJson<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
      fatalError("Couldn't find \(filename) in main Bundle.")
    }
    do {
      data = try Data(contentsOf: file)
      do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
      } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
      }
    } catch {
      fatalError("Couldn't find \(filename) from main Bundle:\n\(error)")
    }
  }
}

// This is Detail view which shows info of selected person from the list.
struct DetailView: View {
  var person: Person
  var body: some View {
    VStack {
      Text("Name: \(person.info?.title ?? "") \(person.name ?? "")")
      Text("Age: \(person.info?.age ?? 0)")
      Text("Phone: \(person.info?.phone ?? "")")
      Text("Email: \(person.info?.email ?? "")")
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
