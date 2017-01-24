// argument0 = Buyer, instance will gain inventory, lose money
// argument1 = Seller, instance will lose inventory, gain money
// argument2 = Commodity #
// argument3 = Quantity
// argument4 = Price Check?  If true, nothing changes hands, returns total $ cost.
// argument5 = Seller is Market? (if false, Player is selling to market.)

var buyer, seller, commodity, quantity, priceCheck, market, demander, basePrice, demand;
buyer = argument0;
seller = argument1;
commodity = argument2;
quantity = argument3;
priceCheck = argument4;
market = argument5;
basePrice = ds_grid_get(commList, 11, commodity);

// Who should I check with about demand curve?
if market {demander = seller;}
else {demander = buyer;}
demand = ds_grid_get(demander.commodities, 1, commodity);

// Is there enough stock?
if !priceCheck {if quantity > ds_grid_get(seller.commodities, 0, commodity) {exit;}}

// Run through the transactions one at a time, total the price.
var price, totalPrice, startingStock, stock, a;
totalPrice = 0;
startingStock = ds_grid_get(demander.commodities, 0, commodity);
stock = startingStock + 1;
for (a = 0; a < quantity; a++)
{price = basePrice * demand / stock;
 if market {stock--;} else {stock++;}
 totalPrice += price;}

// Is there enough money?
if !priceCheck {if !market {if totalPrice > buyer.money {exit;}}}
 
// If this is a price check, return the total.  Otherwise, move money & goods.
if priceCheck {return totalPrice;}
else
{ds_grid_add(buyer.commodities, 0, commodity, quantity);
 ds_grid_add(seller.commodities, 0, commodity, -quantity);
 buyer.money -= totalPrice;
 seller.money += totalPrice;}
