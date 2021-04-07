cd /Users/dominik/Documents/Swift/Bang
sourcekitten doc -- -workspace Bang.xcworkspace -scheme Bang >> ./docs/bangdocs.json
swift-relationship-graph ./docs/bangdocs.json graph protocols,structs,classes ./docs/bangdocs.pdf