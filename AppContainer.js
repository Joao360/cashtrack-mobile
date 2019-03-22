import { createStackNavigator, createAppContainer } from 'react-navigation'
import Main from './containers/Main'
import RecordEdition from './containers/RecordEdition'

const RootStack = createStackNavigator(
  {
    Main,
    RecordEdition
  },
  { 
    initialRouteName: 'Main',
    defaultNavigationOptions: {
      // headerStyle: {
      //   backgroundColor: '#f4511e',
      // },
      // headerTintColor: '#fff',
      // headerTitleStyle: {
      //   fontWeight: 'bold',
      // },
    },
  }
)

const AppContainer = createAppContainer(RootStack)

export default AppContainer
