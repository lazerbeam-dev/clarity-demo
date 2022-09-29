
;; vault
;; you can stack your stacks in this cool demo stacking program
;; but don't

;; Constants
;; Owner
(define-data-var contract-owner principal tx-sender)

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

(define-public (transfer-contract-ownership (new-owner principal))
    (if (is-eq (var-get contract-owner) tx-sender)
        (ok (print "would transfer ownership here"))
        (err (print "ownly the owner can transfer ownership"))
    )
)