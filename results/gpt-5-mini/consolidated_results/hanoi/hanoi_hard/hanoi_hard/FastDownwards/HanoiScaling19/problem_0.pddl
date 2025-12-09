(define (problem hanoi6-problem)
  (:domain hanoi-domain)
  (:objects
    pegL pegM pegR - peg
    disk1 disk2 disk3 disk4 disk5 disk6 - disk
  )
  (:init
    ; Initial supports: R has stack [6,5,4,3,2,1] bottom->top
    (on disk6 pegR)
    (on disk5 disk6)
    (on disk4 disk5)
    (on disk3 disk4)
    (on disk2 disk3)
    (on disk1 disk2)

    ; Initial clear facts: pegL and pegM empty, pegR not clear; only top disk disk1 is clear
    (clear pegL)
    (clear pegM)
    (clear disk1)

    ; Size ordering: smaller(diski, diskj) for all i<j (strict total order)
    (smaller disk1 disk2) (smaller disk1 disk3) (smaller disk1 disk4) (smaller disk1 disk5) (smaller disk1 disk6)
    (smaller disk2 disk3) (smaller disk2 disk4) (smaller disk2 disk5) (smaller disk2 disk6)
    (smaller disk3 disk4) (smaller disk3 disk5) (smaller disk3 disk6)
    (smaller disk4 disk5) (smaller disk4 disk6)
    (smaller disk5 disk6)

    ; Mark the largest disk and the designated source/target pegs
    (largest disk6)
    (is-source pegR)
    (is-target pegL)

    ; moved-disk6 is false initially (absent); it will be added when disk6 is moved by the special action
  )

  (:goal (and
    ; Final stack on pegL: [6,5,4,3,2,1] bottom->top
    (on disk6 pegL)
    (on disk5 disk6)
    (on disk4 disk5)
    (on disk3 disk4)
    (on disk2 disk3)
    (on disk1 disk2)

    ; Other pegs empty
    (clear pegM)
    (clear pegR)
  ))
)