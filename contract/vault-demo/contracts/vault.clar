;; vault
;; you can stack your stacks in this cool demo stacking program

;; Constants
;; Owner
(define-data-var contract-owner principal tx-sender)
;; Errors
(define-constant err-insufficient-funds (err u100))
(define-constant err-transaction-error (err u101))
(define-constant err-not-owner (err u102))

;; ;; data maps and vars
(define-map deposits principal uint)

;;private functions
(define-read-only (get-total-deposit (who principal))
    (default-to u0 (map-get? deposits who))
)

;; public functions
;;
(define-public (deposit (amount uint))
    (begin
            ;; #[allow(unchecked_data)]
        (map-set deposits tx-sender (+ (get-total-deposit tx-sender) amount))
        (stx-transfer? amount tx-sender (as-contract tx-sender))
    )
)

(define-public (withdraw (amount uint))
    (if (> (get-total-deposit tx-sender) amount) 
        (ok (begin 
            (map-set deposits tx-sender (- (get-total-deposit tx-sender) amount))
            (let ((recipient tx-sender)) (as-contract (stx-transfer? amount .vault recipient)))
            )
        )
        (err err-insufficient-funds)
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
