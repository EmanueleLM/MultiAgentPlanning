(define (domain hanoi)
  (:requirements :strips :typing)
  (:types support disk peg - support)
  (:predicates
    (on ?d - disk ?s - support)    ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - support)          ; nothing is directly on support ?s
    (smaller ?small - disk ?large - disk) ; static size ordering: ?small is smaller than ?large
  )

  ;; Move a disk onto another disk (the destination disk must be top/clear and larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)         ; ?d is the topmost on its stack
      (clear ?to)        ; destination disk is topmost (so we put ?d on it)
      (smaller ?d ?to)   ; size constraint: ?d must be smaller than destination
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ; after removing ?d, its previous support becomes clear
      (not (clear ?to))  ; destination no longer clear because ?d is on it
    )
  )

  ;; Move a disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)        ; ?d is the topmost on its stack
      (clear ?to)       ; peg is empty (we move onto an empty peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)