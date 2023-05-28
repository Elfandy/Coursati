// @ts-nocheck
import Main from "./pages/home/Main";
import Root from "./pages/Root";
import Login from "login/Login";
import Courses_center from "pages/courses_center/Courses_center ";
import Users from "./pages/users/Users";
import Supervisors from "pages/supervisors/Supervisors";
import {
  BrowserRouter,
  createBrowserRouter,
  createRoutesFromElements,
  Route,
  RouterProvider,
  Navigate,
  Routes,
  Router
} from "react-router-dom";

import { ClosedCaption } from "@mui/icons-material";



const router = createBrowserRouter(
  createRoutesFromElements(

<Route>
<Route>
{
sessionStorage.getItem('token')!=null ?
  <Route path="/" element={<Root/>}>
  <Route path="/Main" element={<Main />}/>   
  <Route path="Courses_center" element={<Courses_center/>}/> 
  <Route path="Users" element={<Users/>}/> 
  <Route path="Supervisors" element={<Supervisors/>}/> 
  </Route>
:
  <Route path="/" element={<Login/>}/>

}
 
    </Route>
   </Route>

  )
);



function App() {
  // const {getToken} = Auth();
  // if(!getToken){
  //     return (<BrowserRouter>
  //       <Route path="/" element={<Login />}>
    
  //       </Route>
  //       </BrowserRouter>
  //       );

  // }else{
  return <RouterProvider router={router} />;
  }


// }


export default App;
