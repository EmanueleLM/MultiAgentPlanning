(define (domain hanoi)
  (:requirements :strips :typing)
  (:types place stage)

  (:predicates
    (on ?d - place ?p - place)        ; ?d is directly on ?p (peg or another disk)
    (clear ?p - place)                ; nothing directly on this place (peg or disk)
    (smaller ?d1 - place ?d2 - place) ; size ordering relation between disks (static)
    (disk ?p - place)                 ; unary classifier: is a disk
    (peg ?p - place)                  ; unary classifier: is a peg
    (succ ?s - stage ?s2 - stage)     ; ordered discrete stages
    (current ?s - stage)              ; which stage is active
  )

  ;; Move a top disk to an empty peg, advancing the global stage.
  (:action move-to-peg
    :parameters (?d - place ?under - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (disk ?d)
      (on ?d ?under)
      (clear ?d)
      (peg ?to)
      (clear ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another top disk (smaller-on-larger enforced), advancing the stage.
  (:action move-to-disk
    :parameters (?d - place ?under - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (disk ?d)
      (disk ?to)
      (on ?d ?under)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)