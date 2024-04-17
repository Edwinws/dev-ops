### Code

```js
const ulTree = document.querySelector("div[class^='awsui_content_']>ul[data-component='tree']>li>ul");
function collapse(element) {
	for (const li of element.children) {
		if (li.children[0].querySelector("div>a").innerHTML === '/v1') {
			collapse(li.children[1]);
			continue;
		}

		const v1SubButton = li.children[0].querySelector("button");
		if (v1SubButton.getAttribute("aria-expanded") === 'true') {
			v1SubButton.click();
		}
	}
}

collapse(ulTree);
```

### Bookmarklet

```
javascript:(() => {const ulTree=document.querySelector("div[class^='awsui_content_']>ul[data-component='tree']>li>ul");function collapse(e){for(const c of e.children){if("/v1"===c.children[0].querySelector("div>a").innerHTML){collapse(c.children[1]);continue}const e=c.children[0].querySelector("button");"true"===e.getAttribute("aria-expanded")&&e.click()}}collapse(ulTree);})();
```