import { createStackNavigator, createAppContainer } from 'react-navigation'
import Main from './containers/Main'
import RecordDetails from './containers/RecordDetails'

const RootStack = createStackNavigator(
  {
    Main,
    RecordDetails
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
