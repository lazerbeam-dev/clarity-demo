
;; vault
;; you can stack your stacks in this cool demo stacking program
;; but don't

;; Constants
;; Owner
(define-data-var contract-owner principal tx-sender)

;; Errors
(define-constant err-nothing-to-withdraw (err u100))
(define-constant err-transaction-error (err u101))
(define-constant err-not-owner (err u102))

;; ;; data maps and vars
(define-map stakerAmounts principal int)

;; public functions
;;
(define-public (add-balance (staker principal) (amount int)) 
        (ok (print "hello"))
)

(define-public (transfer-contract-ownership (new-owner principal))
    (if (is-eq (var-get contract-owner) tx-sender)
        ;; #[allow(unchecked_data)]
        (ok (var-set contract-owner new-owner))
        (err (print "ownly the owner can transfer ownership"))
    )
)

(define-public (transfer-contract (new-owner principal))
    (begin
        (asserts! (is-eq (var-get contract-owner) tx-sender) (err u102))
        ;; TODO: check that new-owner is valid i.e. not a contract
        ;; #[allow(unchecked_data)]
        (ok (var-set contract-owner new-owner))
    )
)
        ;; 
        ;; (ok (var-set contract-owner new-owner))
        ;; (err (print "ownly the owner can transfer ownership"))
