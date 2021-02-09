

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
   - return the result of Scaffold() passing our appBar as a PerferredSizeWidget() passing my desired size 


#### store the data
    - create a class to store the data ex. class News
      - need where the data is fetched
      - need data format ( assuming json )
    - format the class according to the format of the fetched *news* data
    - parse and store the fetched json['id'], json['url'] ect.