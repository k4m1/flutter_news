

### overview ( no particular order )
- data
   - where will the data be fetched from
   - what will the format of the be ( json )
   - process the recived data
   - store the data
 - app bar
   - NewsApp -> stateless widget
   - materialApp theming
   - styling
 - homepage
   - HomePage -> stateful widget
   - track the _HomePageState ( underscore to show that this interface should not be public )
   - return the result of Scaffold() passing our appBar as a PerferredSize() passing my desired size as perferredSize:
     - appBar should have a prop called child: that is a Column(), containing children: <widgets>
     - the <widgets> need to be wrapped in a Container with the appBar and a title and be styled


#### store the data
    - create a class to store the data ex. class News
      - need where the data is fetched
      - need data format ( assuming json )
    - format the class according to the format of the fetched *news* data
    - parse and store the fetched json['id'], json['url'] ect.