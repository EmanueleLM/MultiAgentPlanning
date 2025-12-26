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
        (disk-at ?d - disk ?p - peg) ; Explicit location tracking for consistency
    )

    ;; 1. Moving a disk D, resting on D_UNDER, onto a disk D_OVER
    (:action move-disk-to-disk
        :parameters (?d - disk
                     ?from - peg
                     ?to - peg
                     ?d_under - disk ; Disk D is moving off of (exposing D_UNDER)
                     ?d_over - disk  ; Disk D is moving onto (covering D_OVER)
        )
        :precondition (and
            (top-disk ?d ?from)
            (disk-at ?d ?from)        ; D must be located at FROM
            (on ?d ?d_under)
            (disk-at ?d_under ?from)  ; D_UNDER must also be located at FROM
            
            (disk-at ?d_over ?to)     ; D_OVER must be located at TO
            (top-disk ?d_over ?to)    
            (smaller ?d ?d_over)
            (not (= ?from ?to))
        )
        :effect (and
            ; Location changes for D
            (not (disk-at ?d ?from))
            (disk-at ?d ?to)
            
            ; D leaves FROM
            (not (on ?d ?d_under))
            (top-disk ?d_under ?from)

            ; D lands on TO
            (not (top-disk ?d_over ?to))
            (on ?d ?d_over)
            (top-disk ?d ?to)
        )
    )

    ;; 2. Moving a disk D, resting on D_UNDER, onto an empty peg TO
    (:action move-disk-to-peg
        :parameters (?d - disk
                     ?from - peg
                     ?to - peg
                     ?d_under - disk ; Disk D is moving off of (exposing D_UNDER)
        )
        :precondition (and
            (top-disk ?d ?from)
            (disk-at ?d ?from)
            (on ?d ?d_under)
            (disk-at ?d_under ?from) ; D_UNDER must be located at FROM
            
            (peg-empty ?to)
            (not (= ?from ?to))
        )
        :effect (and
            ; Location changes for D
            (not (disk-at ?d ?from))
            (disk-at ?d ?to)

            ; D leaves FROM
            (not (on ?d ?d_under))
            (top-disk ?d_under ?from)

            ; D lands on TO
            (not (peg-empty ?to))
            (on-peg ?d ?to)
            (top-disk ?d ?to)
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
            (top-disk ?d ?from)
            (disk-at ?d ?from)
            (on-peg ?d ?from)         ; D is the bottom disk on FROM (emptying the peg)
            
            (disk-at ?d_over ?to)
            (top-disk ?d_over ?to)    ; D_OVER is the current top disk on TO
            (smaller ?d ?d_over)      ; Size constraint
            (not (= ?from ?to))
        )
        :effect (and
            ; Location changes for D
            (not (disk-at ?d ?from))
            (disk-at ?d ?to)
            
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
            (disk-at ?d ?from)
            (on-peg ?d ?from)
            (peg-empty ?to)
            (not (= ?from ?to))
        )
        :effect (and
            ; Location changes for D
            (not (disk-at ?d ?from))
            (disk-at ?d ?to)
            
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