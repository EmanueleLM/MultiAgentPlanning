(define (domain hanoi-seven)
  ;; Tower of Hanoi domain for FastDownward (STRIPS + typing)
  ;; Types: disk and peg are subtypes of place to allow (on ?disk ?place).
  (:requirements :strips :typing)
  (:types disk peg - object place) ; declare a place supertype by naming it; disk and peg are objects typed as needed below

  ;; Predicates:
  ;; (on ?d ?p)  : disk ?d is directly on place ?p where place is either a disk or a peg
  ;; (clear ?p)  : place ?p has nothing directly on it (a peg is empty or a disk has no disk above it)
  ;; (smaller ?x ?y) : disk ?x is strictly smaller than disk ?y (size ordering)
  (:predicates
    (on ?d - disk ?p - object)  ; second arg is a place: either a disk or a peg (objects typed below)
    (clear ?p - object)
    (smaller ?x - disk ?y - disk)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Action schemas
  ; We encode two separate action schemas to avoid union-types in parameters:
  ; 1) move-to-peg: move a top disk onto an empty peg
  ; 2) move-to-disk: move a top disk onto another top disk (requires size check)
  ; Keep them conceptually distinct (comments explain roles).
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Move a top disk from its current place (either a peg or a disk) onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?under - object ?to - peg)
    :precondition (and
      (on ?d ?under)      ; ?d is directly on ?under (peg or disk)
      (clear ?d)          ; ?d is top (nothing above it)
      (clear ?to)         ; target peg is empty (top free)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)      ; the place that supported ?d becomes clear after removing ?d
      (not (clear ?to))   ; target peg now has a disk on it, so not clear
      ;; ?d remains clear (top) because nothing is placed on it
    )
  )

  ; Move a top disk from its current place onto another top disk, respecting size constraints.
  (:action move-to-disk
    :parameters (?d - disk ?under - object ?to - disk)
    :precondition (and
      (on ?d ?under)      ; ?d is directly on ?under (peg or disk)
      (clear ?d)          ; ?d is top (nothing above it)
      (clear ?to)         ; destination disk has nothing above it (is top)
      (smaller ?d ?to)    ; cannot place larger disk ?d onto smaller ?to
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)      ; the place that supported ?d becomes clear after removal
      (not (clear ?to))   ; the disk ?to now has a disk on top, so not clear
      ;; ?d remains clear (top)
    )
  )

)