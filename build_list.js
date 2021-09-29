const fse = require('fs-extra')

fse.readFile('./lib/sanctioned_addresses_ETH.json', 'utf8', (err, data) => {

    if (err) {
        console.error(`Error reading file from disk: ${err}`);
    } else {
        const sanctioned_addresses_ETH = JSON.parse(data);

        // print all listed addresses 
        sanctioned_addresses_ETH.forEach(sanctioned_addresses_ETH => {
       //     console.count()
            console.log(sanctioned_addresses_ETH);
        });
    }
const version = 'Fri Apr 16 00:13:02 UTC 2021';
console.log(`Latest OFAC update was ${version}`);
});