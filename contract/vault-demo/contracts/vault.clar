
;; vault
;; you can stack your stacks in this cool demo stacking program
;; but don't

;; Constants
;; Owner
(define-constant contract-owner tx-sender)

;; Errors
(define-constant err-nothing-to-withdraw (err u100))
(define-constant err-transaction-error (err u101))

;; ;; data maps and vars
(define-map stakerAmounts principal int)

;; public functions
;;
(define-public (add-balance (staker principal) (amount int)) 
        (ok (print "hello"))
)