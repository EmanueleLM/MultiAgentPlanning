(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object step)

  (:predicates
    ;; disk is immediately on support (support is a peg or a disk, typed as object)
    (on ?d - disk ?s - object)
    ;; object (disk or peg) has nothing on top of it
    (clear ?s - object)
    ;; strict size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; assign a particular step to a particular move: at step S move disk D from FROM to TO
    (assign ?st - step ?d - disk ?from - object ?to - object)
    ;; current step marker to enforce sequential execution
    (current ?st - step)
    ;; step successor relation to enforce contiguity
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move when destination support is an empty peg
  (:action move-onto-peg
    :parameters (?s - step ?d - disk ?from - object ?to - peg ?next - step)
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
              (not (clear ?to))   ;; peg now occupied
              (clear ?from)       ;; whatever was supporting ?d becomes clear
              (clear ?d)          ;; moved disk has nothing above it
              (not (current ?s))
              (current ?next)
            )
  )

  ;; Move when destination support is an existing disk (place disk onto another disk)
  (:action move-onto-disk
    :parameters (?s - step ?d - disk ?from - object ?to - disk ?next - step)
    :precondition (and
                    (current ?s)
                    (assign ?s ?d ?from ?to)
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)         ;; destination disk must be top
                    (smaller ?d ?to)    ;; size ordering: moved disk must be smaller
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))   ;; destination disk no longer top
              (clear ?from)       ;; whatever was supporting ?d becomes top/clear
              (clear ?d)          ;; moved disk has nothing above it
              (not (current ?s))
              (current ?next)
            )
  )
)