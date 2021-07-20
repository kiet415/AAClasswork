import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from "../actions/steps_actions";

const initialState = {
          1: { // this is the step with id = 1
            id: 1,
            title: 'walk to store',
            done: false,
            todo_id: 1
          },
          2: { // this is the step with id = 2
            id: 2,
            title: 'buy soap',
            done: false,
            todo_id: 1
            }
      }

export const stepsReducer = (oldState = initialState, action) => {
    Object.freeze(oldState);
    const nextState = Object.assign({}, oldState)
    
    switch (action.type) {
        case RECEIVE_STEPS:
            for(let i = 0; i < action.length; i++) {
                nextState[action[i].id] = action[i];
            }
            return nextState;
        case RECEIVE_STEP:
            const newStep = {[action.step.id] : action.step}
            return Object.assign({}, oldState , newStep);
        case REMOVE_STEP:
            delete nextState[action.step.id]
            return nextState;
        default:
            return oldState;
    }
}