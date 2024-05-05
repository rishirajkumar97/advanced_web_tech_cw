export const mutations = {
    setIsSignInPanelActive(state, newVal) {
        state.isSignInPanelActive = newVal;
    },
    setCurrentSignUpStep(state, newVal) {
        state.currentSignUpStep = newVal;
    },
    setFormData(state, newVal) {
        state.formData = {...state.formData, ...newVal };
    },
    setShowAlert(state, newVal) {
        state.showAlert =newVal;
        console.log("New value set",newVal)
    },

};