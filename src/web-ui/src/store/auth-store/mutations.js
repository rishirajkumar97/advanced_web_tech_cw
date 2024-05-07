export const mutations = {
    setIsSignInPanelActive(state, newVal) {
        state.isSignInPanelActive = newVal;
    },
    setCurrentSignUpStep(state, newVal) {
        state.currentSignUpStep = newVal;
    },
    setFormData(state, newVal) {
        state.formData = {...state.formData, ...newVal };
        console.log( "print form data", state.formData)
    },
    setShowAlert(state, newVal) {
        state.showAlert =newVal;
        console.log("New value set",newVal)
    },
    setLoggedIn(state, newVal) {
        state.loggedin =newVal;
    },

};