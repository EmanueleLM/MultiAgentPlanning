(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?d - disk ?p - peg)
  )

  ;;; Actions for moving disk a (smallest) between pegs
  (:action move-a-left-middle
    :precondition (and (on a left))
    :effect (and (not (on a left)) (on a middle))
  )
  (:action move-a-left-right
    :precondition (and (on a left))
    :effect (and (not (on a left)) (on a right))
  )
  (:action move-a-middle-left
    :precondition (and (on a middle))
    :effect (and (not (on a middle)) (on a left))
  )
  (:action move-a-middle-right
    :precondition (and (on a middle))
    :effect (and (not (on a middle)) (on a right))
  )
  (:action move-a-right-left
    :precondition (and (on a right))
    :effect (and (not (on a right)) (on a left))
  )
  (:action move-a-right-middle
    :precondition (and (on a right))
    :effect (and (not (on a right)) (on a middle))
  )

  ;;; Actions for moving disk b (second smallest)
  ;;; Precondition: b is on source and no smaller disk (a) is on the source.
  ;;; Destination must not contain any smaller disk (a).
  (:action move-b-left-middle
    :precondition (and (on b left) (not (on a left)) (not (on a middle)))
    :effect (and (not (on b left)) (on b middle))
  )
  (:action move-b-left-right
    :precondition (and (on b left) (not (on a left)) (not (on a right)))
    :effect (and (not (on b left)) (on b right))
  )
  (:action move-b-middle-left
    :precondition (and (on b middle) (not (on a middle)) (not (on a left)))
    :effect (and (not (on b middle)) (on b left))
  )
  (:action move-b-middle-right
    :precondition (and (on b middle) (not (on a middle)) (not (on a right)))
    :effect (and (not (on b middle)) (on b right))
  )
  (:action move-b-right-left
    :precondition (and (on b right) (not (on a right)) (not (on a left)))
    :effect (and (not (on b right)) (on b left))
  )
  (:action move-b-right-middle
    :precondition (and (on b right) (not (on a right)) (not (on a middle)))
    :effect (and (not (on b right)) (on b middle))
  )

  ;;; Actions for moving disk c (third smallest)
  ;;; Precondition: c on source and no smaller disks (a,b) on source.
  ;;; Destination must not contain any smaller disk (a,b).
  (:action move-c-left-middle
    :precondition (and (on c left) (not (on a left)) (not (on b left)) (not (on a middle)) (not (on b middle)))
    :effect (and (not (on c left)) (on c middle))
  )
  (:action move-c-left-right
    :precondition (and (on c left) (not (on a left)) (not (on b left)) (not (on a right)) (not (on b right)))
    :effect (and (not (on c left)) (on c right))
  )
  (:action move-c-middle-left
    :precondition (and (on c middle) (not (on a middle)) (not (on b middle)) (not (on a left)) (not (on b left)))
    :effect (and (not (on c middle)) (on c left))
  )
  (:action move-c-middle-right
    :precondition (and (on c middle) (not (on a middle)) (not (on b middle)) (not (on a right)) (not (on b right)))
    :effect (and (not (on c middle)) (on c right))
  )
  (:action move-c-right-left
    :precondition (and (on c right) (not (on a right)) (not (on b right)) (not (on a left)) (not (on b left)))
    :effect (and (not (on c right)) (on c left))
  )
  (:action move-c-right-middle
    :precondition (and (on c right) (not (on a right)) (not (on b right)) (not (on a middle)) (not (on b middle)))
    :effect (and (not (on c right)) (on c middle))
  )

  ;;; Actions for moving disk d (largest)
  ;;; Precondition: d on source and no smaller disks (a,b,c) on source.
  ;;; Destination must not contain any smaller disk (a,b,c).
  (:action move-d-left-middle
    :precondition (and (on d left) (not (on a left)) (not (on b left)) (not (on c left)) (not (on a middle)) (not (on b middle)) (not (on c middle)))
    :effect (and (not (on d left)) (on d middle))
  )
  (:action move-d-left-right
    :precondition (and (on d left) (not (on a left)) (not (on b left)) (not (on c left)) (not (on a right)) (not (on b right)) (not (on c right)))
    :effect (and (not (on d left)) (on d right))
  )
  (:action move-d-middle-left
    :precondition (and (on d middle) (not (on a middle)) (not (on b middle)) (not (on c middle)) (not (on a left)) (not (on b left)) (not (on c left)))
    :effect (and (not (on d middle)) (on d left))
  )
  (:action move-d-middle-right
    :precondition (and (on d middle) (not (on a middle)) (not (on b middle)) (not (on c middle)) (not (on a right)) (not (on b right)) (not (on c right)))
    :effect (and (not (on d middle)) (on d right))
  )
  (:action move-d-right-left
    :precondition (and (on d right) (not (on a right)) (not (on b right)) (not (on c right)) (not (on a left)) (not (on b left)) (not (on c left)))
    :effect (and (not (on d right)) (on d left))
  )
  (:action move-d-right-middle
    :precondition (and (on d right) (not (on a right)) (not (on b right)) (not (on c right)) (not (on a middle)) (not (on b middle)) (not (on c middle)))
    :effect (and (not (on d right)) (on d middle))
  )
)