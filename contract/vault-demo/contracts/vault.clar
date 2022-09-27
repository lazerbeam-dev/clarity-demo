
;; vault
;; you can stack your stacks in this cool demo stacking program
;; but don't

;; data maps and vars
(define-map stakerAmounts
    {balance int 0}
    {user principal}
)

;; private functions
;;

;; public functions
;;
(define-read-only (get-contract-owner)
    (ok (var-get contract-owner))
)

(define-public (addBalance (staker principal)(amount int))
    (ok (stx-(stx-transfer? amount staker (var-get contract-owner)))
))

