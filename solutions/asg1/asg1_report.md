      Arpit Kaushal - 18110024
      Date - 18/06/2020    

1. [Problem A2](#problem-a2)
   1. [Description](#description)
   2. [Solving by Euler's Method](#solving-by-eulers-method)
   3. [MATLAB Code](#matlab-code)
   4. [Plot](#plot)
   5. [Observation](#observation)
2. [Problem A4](#problem-a4)
   1. [Description](#description-1)
   2. [Zero order Approximation](#zero-order-approximation)
   3. [First order Approximation](#first-order-approximation)
   4. [Second order Approximation](#second-order-approximation)
   5. [Third order Approximation](#third-order-approximation)
   6. [Observation](#observation-1)


## Problem A2

### Description
We're given an RLC Circuit, and we have to find out (approximately) the `current` **${i}$** in the main (and only) branch, and `charge` **${q}$** on the capacitor.  

Initially the capacitor has a charge ${q = 1C}$, which then discharges to set up a current in the branch. To calculate current we apply  *Kirchoff's Loop Law* in the branch by assuming a direction of the current.

<div align="center">
<img src="/assets/asg1_1-0.JPG">
</div>


Applying the *Loop Law* we get the following set of differential equations to work with. 

$${iR+L\frac{di}{dt}+\frac{q}{C}=0}$$ $${\frac{dq}{dt}=i}$$ 
where, 
&nbsp;${i \;= \text{current in the branch}}$
&nbsp;${L = \text{inductance}}$
&nbsp;${R = \text{resistance}}$
&nbsp;${C = \text{capacitance}}$
&nbsp;${q \;= \text{charge on capacitor}}$

### Solving by Euler's Method
We solve the seet of differential equations iteratively. Replacing, $${\frac{dq}{dt}=\frac{q_{n+1} - q_{n}}{\Delta t}}$$ and, $${\frac{di}{dt}=\frac{i_{n+1} - i_{n}}{\Delta t}}$$ The equations reduce to,
$${q_{n+1} = q_n + i_n\Delta t}$$ $${i_{n+1} = i_n\left(1-\frac{R}{l}\Delta t\right) - \frac{q_n\Delta t}{LC}}$$ where ${\Delta t}$ is the step size of time. In the given problem, 
${\Delta t = 0.01s}$ 
${t_0 = 0s}$
${t_{final} = 0.1s}$ 

<!-- <br>
<br>
<br>
<br>
<br>
<br>
</br> -->

### MATLAB Code
@import "/assets/asg1_1.m" {as="MATLAB" class="line-numbers" line_end=39}

<!-- <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</br> -->

### Plot
<div align="center">
<img src="/assets/asg1_1-1.jpg" width="600px" height="450px">
<img src="/assets/asg1_1-2.jpg" width="600px" height="450px">
</div>

### Observation
Initially, the current in the opposite (*w.r.t.* the direction assumed) direction increases, and the charge on capacitor decreases. The electrical energy of capcitor ${C}$ transforms into the magnetic energy of inductor ${L \left(\because V_L = L\frac{di}{dt}\right)}$. So, with time the Inductor is charged, and Capacitor discharged i.e. ${q = 0}$. Now, inductor becomes the power source, the direction of current reverses, and capcitor begins to accumulate charge (but on opposite plates, and that's the reason for negative charge depicted in plot.) However, we notice that the amplitude of current, ${i}$ and charge ${q}$ have dropped (${|i|}$ goes from 35.2 A to 16.3 A, while ${|q|}$ goes from 1 C to 0.47 C). The mentioned drops are observed because a fraction of power is being dissipated in the Resistor (aka *as copper losses*). And, thus energy oscillates between ${L}$ and ${C}$ until the resistor dissipates all of the energy supplied in system at ${t=0}$. 

## Problem A4

### Description
Given, ${f(x) = 25x^{3} -6x^{2} +7x - 88}$ we need to find  Taylor Series Expansion ( ${0}$ through ${3}$ ) for ${f(3)}$. 

Taylor Series Expansion - 
$${f(x_{i+1}) = f(x_i) + f'(x_i)\Delta x + f''(x_i)\frac{\Delta x^2} {2!} + f'''(x)\frac{\Delta x^3}{3!} + ...}$$

Here, 
&nbsp;&nbsp;${x_{i+1}=3}$
&nbsp;&nbsp;${x_{i}\;\;\;=1} \;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\;\because \textnormal{given base point for calculating} \;{f(3)}$ 
&nbsp;&nbsp;${\Delta x \;= x_{i+1} - x_{i} = 2}$

Some relevant constants, 
&nbsp;&nbsp;${f(1) \;\;= -62}$
&nbsp;&nbsp;${f(3) \;\;= 554}$
&nbsp;&nbsp;${f'(1) \;= 70}$
&nbsp;&nbsp;${f''(1) \;= 138}$
&nbsp;&nbsp;${f'''(1) = 150}$

>Note: Using **${f_{t_i}(x)}$** to denote **Approximate value** of function calculated via ${i^{th}}$ order approximation Taylor Series and **${f_t(x)}$** is the **True Value** of the function at given ${x}$
### Zero order Approximation
If we expand to just the first term `ergo, zero order` in *Taylor Series*, we get, $${f_{t_0}(3) = f(1)}$$ So, ${f_{t_0}(3) = -62}$, which seems to have induced a significant error. 
Precisely, the **True Percent Relative Error** ${\varepsilon_t}$, is given by
$${\varepsilon_t=\frac{\texttt{True Error}}{\texttt{True Value}}*100\%}$$
where, 
&nbsp;&nbsp; ${\texttt{True Error}=E_t= f(x)-f_{t_i}(x) }$
&nbsp;&nbsp; ${\texttt{True Value} = f(x) }$

Thus, True Percent Relative Error for zero order approximation, 
$${\varepsilon_t = \frac{f(3) - f_{t_0}(3)}{f(3)} *100 = \frac{554 - (-62)}{554} *100 = 111.2\%}$$

### First order Approximation
Expand till the second term in *Taylor Series*, we get, 
$${f_{t_1}(3) = f(1) + f'(1)*2}$$ So, ${f_{t_1}(3) = 78}$
The True Percent Relative Error** ${\varepsilon_t}$, is given by

$${\varepsilon_t = \frac{f(3) - f_t(3)}{f(3)} *100 = \frac{554 - 78}{554} *100 = 85.9\%}$$

### Second order Approximation
Expand till the second term in *Taylor Series*, we get, 
$${f_{t_2}(3) = f(1) + f'(1)*2 + f''(1)*\frac{2^{2}}{2!}}$$ So, ${f_{t_2}(3) = 354}$
The True Percent Relative Error** ${\varepsilon_t}$, is given by

$${\varepsilon_t = \frac{f(3) - f_t(3)}{f(3)} *100 = \frac{554 - 354}{554} *100 = 36.1\%}$$

### Third order Approximation
Expand till the second term in *Taylor Series*, we get, 
$${f_{t_3}(3) = f(1) + f'(1)*2 + f''(1)*\frac{2}{2!} + f'''(1)*\frac{2^{3}}{3!}}$$ So, ${f_{t_3}(3) = 554}$
The True Percent Relative Error** ${\varepsilon_t}$, is given by

$${\varepsilon_t = \frac{f(3) - f_t(3)}{f(3)} *100 = \frac{554 - 554}{554} *100 = 0\%}$$

### Observation
As we go on to use more precise approximation using *Taylor Series*, the **True Perecent Relative Error** keeps on decreasing. The given function was a third order polynomial function, and hence the third order approximation is in fact the **True Value** for ${f(3)}$ regardless of the step size ${\Delta x}$, i.e. for any choice of base point, third order approximation is ${100\%}$ accurate.  



