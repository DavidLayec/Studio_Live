import places from 'places.js';

const initAutocomplete = () => {
  const addressInputs = document.querySelectorAll('#studio_address');
  addressInputs.forEach((addressInput) => {
    if (addressInput) {
      places({ container: addressInput });
    }
  })
};

export { initAutocomplete };
