import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import Main from 'pages/home/Main';
import { BrowserRouter,Routes } from 'react-router-dom';
import Courses_center from 'pages/courses_center/Courses_center ';


const root = ReactDOM.createRoot(document.getElementById('root'));


root.render(

  <React.StrictMode>
   <App/>

  </React.StrictMode>

);

