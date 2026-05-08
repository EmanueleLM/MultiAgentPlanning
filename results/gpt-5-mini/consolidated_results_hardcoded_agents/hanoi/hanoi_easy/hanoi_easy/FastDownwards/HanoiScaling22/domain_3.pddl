(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage place)
  ;; peg and disk are subtypes of place
  ;; NOTE: PDDL typing line for subtypes: "disk peg - place stage" is not valid here;
  ;; to keep within simple PDDL, objects will be typed explicitly in the problem.

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)               ; nothing is directly on place ?p (it is the top)
    (smaller ?d1 - disk ?d2 - disk)  ; static: ?d1 is strictly smaller than ?d2
    (current ?s - stage)             ; the planning token denoting the current stage
    (succ ?s1 - stage ?s2 - stage)   ; static successor relation between stages
  )

  ;; Move a top disk onto an empty peg (advances the global stage token)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      ;; advance the stage token
      (not (current ?s))
      (current ?s2)

      ;; relocate the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clears: destination no longer clear, origin becomes clear
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Move a top disk onto another (strictly larger) disk (advances the global stage token)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; advance the stage token
      (not (current ?s))
      (current ?s2)

      ;; relocate the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clears: destination disk no longer clear, origin becomes clear
      (not (clear ?to))
      (clear ?from)
    )
  )
)