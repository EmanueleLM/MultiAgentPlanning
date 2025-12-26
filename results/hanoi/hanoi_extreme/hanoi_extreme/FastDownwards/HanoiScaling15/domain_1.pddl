(define (domain hanoi-7-disks)
    (:requirements :strips :typing)
    (:types
        disk - object
        peg - object
    )
    (:predicates
        (on ?d1 - disk ?d2 - disk)   ; d1 is directly on top of d2
        (on-peg ?d - disk ?p - peg)  ; d is the bottom disk on peg p
        (top-disk ?d - disk ?p - peg) ; d is the top disk on peg p
        (peg-empty ?p - peg)         ; p has no disks
        (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2 (static)
    )

    ;; 1. Moving a disk D, which rests on another disk D_UNDER, onto a disk D_OVER
    (:action move-disk-to-disk
        :parameters (?d - disk
                     ?from - peg
                     ?to - peg
                     ?d_under - disk ; Disk D is moving off of (exposing D_UNDER)
                     ?d_over - disk  ; Disk D is moving onto (covering D_OVER)
        )
        :precondition (and
            (top-disk ?d ?from)       ; D is the disk to move
            (on ?d ?d_under)          ; D is currently on D_UNDER
            (top-disk ?d_over ?to)    ; D_OVER is the current top disk on TO
            (smaller ?d ?d_over)      ; Size constraint: D must be smaller than D_OVER
            (not (= ?from ?to))       ; Must move between pegs
        )
        :effect (and
            ; D leaves FROM
            (not (on ?d ?d_under))
            (top-disk ?d_under ?from) ; D_UNDER becomes the new top disk on FROM

            ; D lands on TO
            (not (top-disk ?d_over ?to)) ; D_OVER is no longer the top disk
            (on ?d ?d_over)
            (top-disk ?d ?to)           ; D is the new top disk on TO
        )
    )

    ;; 2. Moving a disk D, which rests on another disk D_UNDER, onto an empty peg TO
    (:action move-disk-to-peg
        :parameters (?d - disk
                     ?from - peg
                     ?to - peg
                     ?d_under - disk ; Disk D is moving off of (exposing D_UNDER)
        )
        :precondition (and
            (top-disk ?d ?from)
            (on ?d ?d_under)
            (peg-empty ?to)           ; Target peg is empty
            (not (= ?from ?to))
        )
        :effect (and
            ; D leaves FROM
            (not (on ?d ?d_under))
            (top-disk ?d_under ?from) ; D_UNDER becomes the new top disk on FROM

            ; D lands on TO
            (not (peg-empty ?to))
            (on-peg ?d ?to)           ; D is now the bottom disk on TO
            (top-disk ?d ?to)         ; D is the new top disk on TO
        )
    )
    
    ;; 3. Moving the bottom disk D (on-peg FROM) onto a disk D_OVER
    (:action move-bottom-disk-to-disk
        :parameters (?d - disk
                     ?from - peg
                     ?to - peg
                     ?d_over - disk  ; Disk D is moving onto (covering D_OVER)
        )
        :precondition (and
            (top-disk ?d ?from)       ; D must be the top disk
            (on-peg ?d ?from)         ; D is the bottom disk on FROM (emptying the peg)
            (top-disk ?d_over ?to)    ; D_OVER is the current top disk on TO
            (smaller ?d ?d_over)      ; Size constraint
            (not (= ?from ?to))
        )
        :effect (and
            ; D leaves FROM
            (not (on-peg ?d ?from))
            (peg-empty ?from)
            
            ; D lands on TO
            (not (top-disk ?d_over ?to))
            (on ?d ?d_over)
            (top-disk ?d ?to)
        )
    )

    ;; 4. Moving the bottom disk D (on-peg FROM) onto an empty peg TO
    (:action move-bottom-disk-to-peg
        :parameters (?d - disk
                     ?from - peg
                     ?to - peg
        )
        :precondition (and
            (top-disk ?d ?from)
            (on-peg ?d ?from)
            (peg-empty ?to)
            (not (= ?from ?to))
        )
        :effect (and
            ; D leaves FROM
            (not (on-peg ?d ?from))
            (peg-empty ?from)

            ; D lands on TO
            (not (peg-empty ?to))
            (on-peg ?d ?to)
            (top-disk ?d ?to)
        )
    )
)