import React from "react";
import { Provider } from "react-redux";
import {App} from "./app";

export const Root = (props) => (
    <Provider store = {props.store}>
        <App />
    </Provider>
);