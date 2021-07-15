import React from 'react'

import { usePurchasesQuery } from './Client'

export function Purchases() {
  const { data } = usePurchasesQuery();

  return (
    <div>
      { data && data.purchases?.map(purchase => (
        <div>
          <p>ID: { purchase.id }</p>
          <p>PRICE: { purchase.price }</p>
          <p>BUYER: { purchase.buyer.email }</p>
          <p>SELLER: { purchase.seller.email }</p>
          { purchase.product ? <p>PRODUCT: { purchase.product.name }</p> : null }
          <hr />
        </div>
      ))}
    </div>
  )
}
