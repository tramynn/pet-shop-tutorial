const Adoption = artifacts.require("Adoption");

contract("Adoption", (accounts) => {
    let adoption;
    let expectedAdopter;

    before(async () => {
        adoption = await Adoption.deployed();
    })

    describe("Adopting a pet and retrieving account addresses", async () => {
        before("Adopt a pet using accounts[0]", async () => {
            await adoption.adopt(8), { from: accounts[0] };
            expectedAdopter = accounts[0];
        })
        // Testing the adopt function
        it("can fetch the address of an owner by pet id", async () => {
            const adopter = await adoption.adopters(8);
            assert.equal(adopter, expectedAdopter, "The owner of the adopted pet should be the first account.");
        });
        // Testing retrieval of all pet owners
        it("can fetch the collection of all pet owners' addresses", async () => {
            const adopters = await adoption.getAdopters();
            assert.equal(adopters[8], expectedAdopter, "The owner of the adopted pet should be in the collection.");
        });
    })
})