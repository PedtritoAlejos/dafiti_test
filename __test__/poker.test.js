const isStraight = require("../src/poker");


describe('TEST_ESCALERA_POKER_VALIDO', () =>{
    
    test('14-2-3-4-5',() =>{
        expect(isStraight([14,2,3,4,5])).toBe(true)
    });
    test('9-10-11-12-13', ()=>{
        expect( isStraight([9,10,11,12,13])).toBe(true)
    })
    test('2-7-8-5-10-9-11', () =>{
        expect( isStraight([2,7,8,5,10,9,11]) ).toBe(true)
    })
    test('7-8-12-13-14', () =>{
        expect( isStraight([7,8,12,13,14]) ).toBe(false)
    })

    test('2,3,4,5,6', () =>{
        expect( isStraight([ 2,3,4,5,6 ])).toBe(true)
    })
    test('14,5,4,2,3', () =>{
        expect( isStraight([ 14,5,4,2,3 ])).toBe(true)
    })
    test('2,3,4,5,6', () =>{
        expect( isStraight([ 2,3,4,5,6 ])).toBe(true)
    })
    test('7,7,12,11,3,4,14', () =>{
        expect( isStraight([ 7,7,12,11,3,4,14 ])).toBe(false)
    })
    test('7,3,2', () =>{
        expect( isStraight([ 7,3,2 ])).toBe(false)
    })

});

