import Home from "pages/home/Home";
import Root from "./pages/Root";
import Courses_center from "pages/courses_center/Courses_center ";
import {
  createBrowserRouter,
  createRoutesFromElements,
  Route,
  RouterProvider,
} from "react-router-dom";



const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/" element={<Root />}>
      <Route index element={<Home />} />
      <Route path="courses_center" element={<Courses_center/>} />

      {/* ... etc. */}
    </Route>
  )
);

function App() {
  return <RouterProvider router={router} />;
}

export default App;
