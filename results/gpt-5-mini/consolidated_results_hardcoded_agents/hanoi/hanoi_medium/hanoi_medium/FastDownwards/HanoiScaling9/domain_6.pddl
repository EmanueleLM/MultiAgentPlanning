(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place stage)

  (:predicates
    ;; relational state
    (on ?d - place ?p - place)        ; ?d is directly on ?p (peg or another disk)
    (clear ?p - place)                ; nothing directly on this place (peg or disk)
    (smaller ?d1 - place ?d2 - place) ; size ordering relation between disks (static)
    ;; static unary classifiers to distinguish pegs and disks (used instead of type overloading)
    (disk ?p - place)
    (peg ?p - place)

    ;; explicit stage/time progression
    (succ ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Move a top disk to an empty peg, advancing the global stage.
  (:action move-to-peg
    :parameters (?d - place ?under - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (disk ?d)            ; moved object must be a disk
      (on ?d ?under)       ; ?d is directly on ?under (peg or disk)
      (clear ?d)           ; ?d is the top disk on its support
      (peg ?to)            ; target must be a peg (not a disk)
      (clear ?to)          ; target peg must be empty on top
      (current ?s)         ; enforce single action per stage
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)        ; the supporter becomes clear after removal
      (not (clear ?to))     ; target peg now has something on it
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another top disk (smaller-on-larger enforced), advancing the stage.
  (:action move-to-disk
    :parameters (?d - place ?under - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (disk ?d)            ; moved object must be a disk
      (disk ?to)           ; target must be a disk
      (on ?d ?under)       ; ?d is directly on ?under
      (clear ?d)           ; ?d is top
      (clear ?to)          ; target disk is top
      (smaller ?d ?to)     ; moved disk must be smaller than the target disk
      (current ?s)         ; enforce single action per stage
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)        ; the supporter becomes clear after removal
      (not (clear ?to))     ; target disk is no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )
)