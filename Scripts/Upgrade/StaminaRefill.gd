extends Node



func BuyRefill() :
	if PlayerInventory.Money >= ShopData.StaminaRefillPrice :
		PlayerInventory.SubstractMoney(ShopData.StaminaRefillPrice)
		PlayerStats.CurrentStamina = PlayerStats.MaxStamina
