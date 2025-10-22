(define (domain hanoi8instance10)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg - object)
  (:predicates
    ;; a disk is directly on a place (either a peg or another disk)
    (on ?d - disk ?p - object)
    ;; no disk is on top of this place (peg or disk)
    (clear ?o - object)
    ;; static relation: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg (the destination peg must be clear)
  (:action move-to-peg
    :parameters (?disk - disk ?src - object ?dst - peg)
    :precondition (and
      (on ?disk ?src)        ; disk is directly on src
      (clear ?disk)          ; disk is the top disk at its source
      (clear ?dst)           ; destination peg is clear (empty at top)
      (not (on ?disk ?dst))  ; not already on that destination
    )
    :effect (and
      (not (on ?disk ?src))
      (on ?disk ?dst)
      (clear ?src)           ; the place that held the disk becomes clear
      (not (clear ?dst))     ; destination is no longer clear (this disk is on it)
      (not (clear ?disk))    ; this disk now has something on it (it is not clear)
    )
  )

  ;; Move a top disk onto another disk (destination disk must be clear and larger)
  (:action move-to-disk
    :parameters (?disk - disk ?src - object ?dst - disk)
    :precondition (and
      (on ?disk ?src)        ; disk is directly on src
      (clear ?disk)          ; disk is the top disk at its source
      (clear ?dst)           ; destination disk must be clear (top of its stack)
      (smaller ?disk ?dst)   ; may only place a smaller disk on a larger disk
      (not (on ?disk ?dst))  ; not already on that destination
    )
    :effect (and
      (not (on ?disk ?src))
      (on ?disk ?dst)
      (clear ?src)           ; the place that held the disk becomes clear
      (not (clear ?dst))     ; destination disk is no longer clear (now covered)
      (not (clear ?disk))    ; this disk now has something on it (it is not clear)
    )
  )
)