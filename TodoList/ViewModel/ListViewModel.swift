import Foundation
class ListViewModel {
@Published var items: [ItemModel] = []
init() {
getItems()
}
func getItems() {
let newItems = [
ItemModel(title: "This is the first title!", isCompleted: false),
ItemModel(title: "This is the second!", isCompleted: true),
ItemModel(title: "Third!", isCompleted: false),
]
items.append(contentsOf: newItems)
}
func deleteItem(indexSet: IndexSet) {
items.remove(atOffsets: indexSet)
}
func moveItem(from: IndexSet, to: Int) {
items.move(from Offsets: from, toOffset: to)
}
}