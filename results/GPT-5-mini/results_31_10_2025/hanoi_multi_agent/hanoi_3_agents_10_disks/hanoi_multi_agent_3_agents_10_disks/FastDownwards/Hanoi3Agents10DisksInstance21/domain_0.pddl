(define (domain multi-agent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?d - disk ?p - peg)
    (clear ?d - disk)           ; nothing on top of disk
    (empty ?p - peg)            ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
  )

  ;; Agent 1 explicit primitive moves (preserve ordering in plan)
  (:action agent1-move-a-left1-right1
    :precondition (and (on a left1) (clear a) (empty right1))
    :effect (and
      (not (on a left1)) (on a right1)
      (not (empty right1))
      ;; after removing a, b becomes clear (b was immediately below a on left1)
      (clear b)
    )
  )

  (:action agent1-move-b-left1-middle1
    :precondition (and (on b left1) (clear b) (empty middle1))
    :effect (and
      (not (on b left1)) (on b middle1)
      (not (empty middle1))
      ;; after removing b from left1, c becomes clear
      (clear c)
    )
  )

  (:action agent1-move-a-right1-middle1
    :precondition (and (on a right1) (clear a) (on b middle1) (clear b) (smaller a b))
    :effect (and
      (not (on a right1)) (on a middle1)
      ;; covering b with a
      (not (clear b)) (clear a)
      ;; right1 becomes empty after removing a
      (empty right1)
    )
  )

  (:action agent1-move-c-left1-right1
    :precondition (and (on c left1) (clear c) (empty right1))
    :effect (and
      (not (on c left1)) (on c right1)
      (not (empty right1))
      ;; left1 becomes empty after removing c
      (empty left1)
      (clear c)
    )
  )

  (:action agent1-move-a-middle1-right1
    :precondition (and (on a middle1) (clear a) (on c right1) (clear c) (smaller a c))
    :effect (and
      (not (on a middle1)) (on a right1)
      ;; a covers c
      (not (clear c)) (clear a)
      ;; after a leaves middle1, b becomes clear
      (clear b)
    )
  )

  (:action agent1-move-b-middle1-left1
    :precondition (and (on b middle1) (clear b) (empty left1))
    :effect (and
      (not (on b middle1)) (on b left1)
      (not (empty left1))
      ;; middle1 becomes empty
      (empty middle1)
      (clear b)
    )
  )

  (:action agent1-move-a-right1-left1
    :precondition (and (on a right1) (clear a) (on b left1) (clear b) (smaller a b))
    :effect (and
      (not (on a right1)) (on a left1)
      ;; a covers b
      (not (clear b)) (clear a)
      ;; after a leaves right1, c becomes clear
      (clear c)
    )
  )

  ;; Agent 2 explicit primitive moves (preserve ordering)
  (:action agent2-move-e-left2-middle2
    :precondition (and (on e left2) (clear e) (empty middle2))
    :effect (and
      (not (on e left2)) (on e middle2)
      (not (empty middle2))
      ;; after removing e, f becomes clear
      (clear f)
    )
  )

  (:action agent2-move-f-left2-right2
    :precondition (and (on f left2) (clear f) (empty right2))
    :effect (and
      (not (on f left2)) (on f right2)
      (not (empty right2))
      ;; after removing f, g becomes clear
      (clear g)
    )
  )

  (:action agent2-move-e-middle2-right2
    :precondition (and (on e middle2) (clear e) (on f right2) (clear f) (smaller e f))
    :effect (and
      (not (on e middle2)) (on e right2)
      ;; e covers f
      (not (clear f)) (clear e)
      ;; middle2 becomes empty after removing e (there is no disk below e)
      (empty middle2)
    )
  )

  (:action agent2-move-g-left2-middle2
    :precondition (and (on g left2) (clear g) (empty middle2))
    :effect (and
      (not (on g left2)) (on g middle2)
      (not (empty middle2))
      ;; left2 becomes empty after removing g (it was the only disk)
      (empty left2)
      (clear g)
    )
  )

  (:action agent2-move-e-right2-left2
    :precondition (and (on e right2) (clear e) (empty left2))
    :effect (and
      (not (on e right2)) (on e left2)
      (not (empty left2))
      ;; after removing e from right2, f becomes clear on right2
      (clear f)
    )
  )

  (:action agent2-move-f-right2-middle2
    :precondition (and (on f right2) (clear f) (on g middle2) (clear g) (smaller f g))
    :effect (and
      (not (on f right2)) (on f middle2)
      ;; f covers g
      (not (clear g)) (clear f)
      ;; right2 becomes empty after removing f (if nothing below f)
      (empty right2)
    )
  )

  (:action agent2-move-e-left2-middle2
    :precondition (and (on e left2) (clear e) (on f middle2) (clear f) (smaller e f))
    :effect (and
      (not (on e left2)) (on e middle2)
      ;; e covers f
      (not (clear f)) (clear e)
      ;; left2 becomes empty after removing e (already empty)
      (empty left2)
    )
  )

  ;; Agent 3 explicit primitive moves (preserve ordering)
  (:action agent3-move-j-left3-right3
    :precondition (and (on j left3) (clear j) (empty right3))
    :effect (and
      (not (on j left3)) (on j right3)
      (not (empty right3))
      ;; after removing j, i becomes clear
      (clear i)
    )
  )

  (:action agent3-move-i-left3-right3
    :precondition (and (on i left3) (clear i) (on j right3) (clear j) (smaller i j))
    :effect (and
      (not (on i left3)) (on i right3)
      ;; i covers j
      (not (clear j)) (clear i)
      ;; left3 becomes non-empty if h remains; when i removed, h may become clear
      (clear h)
    )
  )

  (:action agent3-move-h-left3-right3
    :precondition (and (on h left3) (clear h) (on i right3) (clear i) (smaller h i))
    :effect (and
      (not (on h left3)) (on h right3)
      ;; h covers i
      (not (clear i)) (clear h)
      ;; left3 becomes empty
      (empty left3)
    )
  )
)