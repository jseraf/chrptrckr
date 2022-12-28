import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

    let spins_table = document.querySelector('#spins-table');

    const config = { attributes: true,
                     attributeFilter: [ 'div' ],
                     childList: true };

    let observer = new MutationObserver(update_table);
    observer.observe(spins_table, config);

    function update_table(mutationList) {
      if (mutationList[0]['addedNodes'].length >= 1) {
        let lastRow = document.querySelector('#spins-table > div:last-child');
        // remove the last row
        lastRow.remove();
        // ...and next-to-last row, if it's a DJ
        if (lastRow.id.includes('dj')) {
          lastRow.remove();
        }
      }
    };
  }
}

