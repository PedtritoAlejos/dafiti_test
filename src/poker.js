function getConsecutiveNumber (list) {

    return list.reduce( (acc,value,index,array) =>{

            acc['count'] = ( (acc['value'] + 1 ) === value  ) ? (acc['count'] + 1 ) : acc['count']
            acc['count'] = ( index === (array.length -1) && (value - 1) == acc['value']  ) ? (acc['count'] + 1 ) :  acc['count']
            
            acc['value'] = value
        
            return acc
            
        },{'count':0});
}
function isStraight (list) {

   if(list >7 || list <5){
       return false
   }

   list = list.map( (value) =>  (value === 14) ? 1 : value );
   list = list.sort( (a,b) => a -b );
   
   let listCard = getConsecutiveNumber(list);

   return ( listCard.count >= 5 )
    

}
module.exports = isStraight