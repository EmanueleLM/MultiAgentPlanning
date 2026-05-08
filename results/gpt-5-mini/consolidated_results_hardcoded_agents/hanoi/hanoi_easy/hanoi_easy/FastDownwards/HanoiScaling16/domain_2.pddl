(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  ;; types: 'support' is supertype for pegs and disks; 'step' is separate
  (:types support step disk peg - support)

  (:predicates
    ;; disk is immediately on support (support is a peg or a disk)
    (on ?d - disk ?s - support)
    ;; support (peg or disk) has nothing on top of it
    (clear ?s - support)
    ;; strict size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; assign a particular step to a particular move: at step S move disk D from FROM to TO
    (assign ?st - step ?d - disk ?from - support ?to - support)
    ;; current step marker to enforce sequential execution
    (current ?st - step)
    ;; step successor relation to enforce contiguity
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move disk when destination is an empty peg (destination must be a peg)
  (:action move-to-peg
    :parameters (?s - step ?d - disk ?from - support ?to - peg ?next - step)
    :precondition (and
                    (current ?s)
                    (assign ?s ?d ?from ?to)
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?d)
              (not (current ?s))
              (current ?next)
            )
  )

  ;; Move disk when destination is an existing disk (must place onto a larger disk)
  (:action move-to-disk
    :parameters (?s - step ?d - disk ?from - support ?to - disk ?next - step)
    :precondition (and
                    (current ?s)
                    (assign ?s ?d ?from ?to)
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?d)
              (not (current ?s))
              (current ?next)
            )
  )
)