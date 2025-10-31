(define (domain hanoi7)
  (:predicates
    (on ?d ?p)        ; immediate support: disk or peg
    (clear ?p)        ; nothing on top of this place (disk or peg)
    (smaller ?a ?b)   ; a is smaller than b
    (at ?d ?p)        ; disk's current peg (ultimate peg)
  )

  (:constants left middle right)

  ;; Moves from left to middle onto a peg (i.e., source disk is directly on the left peg)
  (:action move-left-to-middle-onto-peg
    :parameters (?d)
    :precondition (and
      (on ?d left)
      (clear ?d)
      (clear middle)
      (at ?d left)
    )
    :effect (and
      (not (on ?d left))
      (on ?d middle)
      (not (clear middle))
      (clear left)
      (not (at ?d left))
      (at ?d middle)
    )
  )

  ;; Moves from left to middle onto another disk
  (:action move-left-to-middle-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d left)
      (at ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d left))
      (at ?d middle)
    )
  )

  ;; Moves from left to right onto a peg
  (:action move-left-to-right-onto-peg
    :parameters (?d)
    :precondition (and
      (on ?d left)
      (clear ?d)
      (clear right)
      (at ?d left)
    )
    :effect (and
      (not (on ?d left))
      (on ?d right)
      (not (clear right))
      (clear left)
      (not (at ?d left))
      (at ?d right)
    )
  )

  ;; Moves from left to right onto another disk
  (:action move-left-to-right-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d left)
      (at ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d left))
      (at ?d right)
    )
  )

  ;; Moves from middle to left onto a peg
  (:action move-middle-to-left-onto-peg
    :parameters (?d)
    :precondition (and
      (on ?d middle)
      (clear ?d)
      (clear left)
      (at ?d middle)
    )
    :effect (and
      (not (on ?d middle))
      (on ?d left)
      (not (clear left))
      (clear middle)
      (not (at ?d middle))
      (at ?d left)
    )
  )

  ;; Moves from middle to left onto another disk
  (:action move-middle-to-left-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d middle)
      (at ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d middle))
      (at ?d left)
    )
  )

  ;; Moves from middle to right onto a peg
  (:action move-middle-to-right-onto-peg
    :parameters (?d)
    :precondition (and
      (on ?d middle)
      (clear ?d)
      (clear right)
      (at ?d middle)
    )
    :effect (and
      (not (on ?d middle))
      (on ?d right)
      (not (clear right))
      (clear middle)
      (not (at ?d middle))
      (at ?d right)
    )
  )

  ;; Moves from middle to right onto another disk
  (:action move-middle-to-right-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d middle)
      (at ?t right)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d middle))
      (at ?d right)
    )
  )

  ;; Moves from right to left onto a peg
  (:action move-right-to-left-onto-peg
    :parameters (?d)
    :precondition (and
      (on ?d right)
      (clear ?d)
      (clear left)
      (at ?d right)
    )
    :effect (and
      (not (on ?d right))
      (on ?d left)
      (not (clear left))
      (clear right)
      (not (at ?d right))
      (at ?d left)
    )
  )

  ;; Moves from right to left onto another disk
  (:action move-right-to-left-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d right)
      (at ?t left)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d right))
      (at ?d left)
    )
  )

  ;; Moves from right to middle onto a peg
  (:action move-right-to-middle-onto-peg
    :parameters (?d)
    :precondition (and
      (on ?d right)
      (clear ?d)
      (clear middle)
      (at ?d right)
    )
    :effect (and
      (not (on ?d right))
      (on ?d middle)
      (not (clear middle))
      (clear right)
      (not (at ?d right))
      (at ?d middle)
    )
  )

  ;; Moves from right to middle onto another disk
  (:action move-right-to-middle-onto-disk
    :parameters (?d ?s ?t)
    :precondition (and
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (at ?d right)
      (at ?t middle)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?s)
      (not (at ?d right))
      (at ?d middle)
    )
  )
)