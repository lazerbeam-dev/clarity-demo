;; vault
;; you can stack your stacks in this cool demo stacking program

;; Constants
;; Owner
(define-data-var contract-owner principal tx-sender)
(define-constant contract-address "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.vault")

;; Errors
(define-constant err-nothing-to-withdraw (err u100))
(define-constant err-transaction-error (err u101))
(define-constant err-not-owner (err u102))

;; ;; data maps and vars
(define-map stakerAmounts principal int)

;; public functions
;;
(define-public (deposit (staker principal) (amount uint)) 
    (stx-transfer? amount tx-sender .vault)
)

(define-public (transfer-contract (new-owner principal))
    (begin
        (asserts! (is-eq (var-get contract-owner) tx-sender) (err u102))
        ;; TODO: check that new-owner is valid i.e. not a contract
        ;; #[allow(unchecked_data)]
        (ok (var-set contract-owner new-owner))
    )
)
