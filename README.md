# SwiftUITest Assessment
The code above defines a SwiftUI ContentView that displays a list of names from the provided JSON data. It uses the Person struct to represent each person's data and the Info struct to store additional information.
The ContentView struct contains a List that displays the names from the sampleData array. Tapping on a name sets the selectedName state variable to that name.
The main view dynamically updates based on the selected name. If a name is selected, it displays the details for that name.
The JSON data is stored in the data constant and decoded into an array of Person objects using JSONDecoder.
