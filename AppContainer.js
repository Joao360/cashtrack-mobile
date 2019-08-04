import { createStackNavigator, createAppContainer } from 'react-navigation'

import Main from './app/containers/Main'
import RecordEdition from './app/containers/RecordEdition'
import CreateRecord from './app/containers/CreateRecord'

const RootStack = createStackNavigator(
  {
    Main,
    RecordEdition,
    CreateRecord
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
