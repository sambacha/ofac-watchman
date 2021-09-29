/**
 * Gets the name of an Ethereum network based on its chain ID.
 *
 * @param {string} chainId The chain ID of the network.
 *
 * @returns {string} Returns the name of the Ethereum network.

 */

export function getNetNameWithChainId(chainId: number) : string {
    const networks = {
      1: 'mainnet',
    };
    return networks[chainId];
}