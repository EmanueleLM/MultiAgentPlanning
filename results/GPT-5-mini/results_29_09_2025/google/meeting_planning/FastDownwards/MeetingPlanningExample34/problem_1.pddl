(define (problem meet-thomas-day)
  (:domain meet-friends)
  (:objects
    t540 t563 t585 t608 t630 t653 t675 t698 t720 t735 t840 t930 t1035 - timepoint
    bayview pacific-heights - location
  )
  (:init
    (= (total-cost) 0)
    (now t540)
    (at bayview t540)

    (allowed-start t735)
    (allowed-start t930)

    (next23 t540 t563)
    (next23 t585 t608)
    (next23 t630 t653)
    (next23 t675 t698)

    (next22 t563 t585)
    (next22 t608 t630)
    (next22 t653 t675)
    (next22 t698 t720)

    (next-to735 t540 t735)
    (next-to735 t563 t735)
    (next-to735 t585 t735)
    (next-to735 t608 t735)
    (next-to735 t630 t735)
    (next-to735 t653 t735)
    (next-to735 t675 t735)
    (next-to735 t698 t735)
    (next-to735 t720 t735)
    (next-to735 t735 t735)

    (next105 t735 t840)
    (next105 t930 t1035)
  )
  (:goal (met-thomas))
  (:metric minimize (total-cost))
)